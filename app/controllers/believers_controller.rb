class BelieversController < InheritedResources::Base

  private

    def believer_params
      params.require(:believer).permit(:temple_id, :name, :addressProvince, :addressDetail, :phone, :gender, :birthday, :registerday, :remarks, :ganzhi, :dharmaName, :email)
    end

end
