module OrganisationsHelper
  def org_type_name(org_type)
    case org_type
    when 1
      "Designer"
    when 2
      "Printer"
    when 3
      "Client"
    end
  end
end
