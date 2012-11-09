module CompaniesHelper
  def company_img(company)
    if Rails.application.assets.find_asset company.image_path
      "<img src=\"#{asset_path(company.image_path)}\" />"
    else
      "<img src=\"#{asset_path("companies/error_company.png")}\" />"
    end
  end
end
