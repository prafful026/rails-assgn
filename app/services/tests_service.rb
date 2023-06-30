class TestsService
  include QuantificationService

  def self.create_test(params)
    validated_strip = Strip.get_validated_strip(strip_code = params[:strip_code], test_type = params[:test_type])

    unless validated_strip
      return { success: false, errors: ["Invalid Strip"] }
    end

    begin
      upload_res = Cloudinary::Uploader.upload(params[:image])
      image_url = upload_res["url"]
    rescue CloudinaryException => e
      return { success: false, errors: ["Error with the image"] }
    end

    begin
      quantification_res = QuantificationService.invoke({ image: image_url })
    rescue QuantificationService::QuantificationServiceError => e
      return { success: false, errors: ["Error with the image processing"] }
    end

    test = Test.new(test_type: params[:test_type], image: image_url, strip_id: validated_strip.id, user_id: params[:user_id])

    quantification_res.each do |hormone_name, values|
      th = TestHormone.new(od_value: values[:od_value], concentration: values[:concentration])
      th.hormone = Hormone.find_by(name: hormone_name.downcase)
      test.test_hormones << th
    end

    unless test.save
      return {
        success: false,
        errors: test.errors
      }
    end

    {
      success: true,
      test: test
    }

  end
end