class DroidsController < InheritedResources::Base
  private

    def droid_params
      params.require(:droid).permit(
        :droid_name,
        :price,
        :series,
        :image,
        :droidclass)
    end
end
