defmodule CcbApiEx.Parsers.IndividualSearch do

  import SweetXml
  
  def list(xml) do
    individuals = 
      xml
      |> xpath(
        ~x"//ccb_api/response/individuals/individual"l,
        id: ~x"./@id"i,
        sync_id: ~x"./sync_id/text()",
        other_id: ~x"./other_id/text()",
        campus_id: ~x"./campus/@id"i,
        campus: ~x"./campus/text()",
        family: ~x"./family/text()",
        family_id: ~x"./modifier/@id"i,
        family_image: ~x"./family_image/text()",
        family_position: ~x"./family_position/text()",
        #family_members
        first_name: ~x"./first_name/text()",
        last_name: ~x"./last_name/text()",
        middle_name: ~x"./middle_name/text()",
        legal_first_name: ~x"./legal_first_name/text()",
        full_name: ~x"./full_name/text()",
        salutation: ~x"./salutation/text()",
        suffix: ~x"./suffix/text()",
        image: ~x"./image/text()",
        email: ~x"./email/text()",
        allergies: ~x"./allergies/text()",
        confirmed_no_allergies: ~x"./confirmed_no_allergies/text()",
        
        addresses: [
          ~x"./addresses/address"l,
          address_type: ~x"./@type",
          street_address: ~x"./street_address/text()",
          city: ~x"./city/text()",
          state: ~x"./state/text()",
          zip: ~x"./zip/text()",
          country_code: ~x"./country/@code"s,
          country: ~x"./country/text()",
          line_1: ~x"./line_1/text()",
          line_2: ~x"./line_2/text()",
          latitude: ~x"./latitude/text()",
          longitude: ~x"./longitude/text()",
        ],
        phones: [
          ~x"./phones/phone"l,
          phone_type: ~x"./@type",
          phone: ~x"./text()",
        ],
        mobile_carrier: ~x"./mobile_carrier/text()",
        gender: ~x"./gender/text()",
        marital_status: ~x"./marital_status/text()",
        birthday: ~x"./birthday/text()",
        anniversary: ~x"./anniversary/text()",
        baptized: ~x"./baptized/text()",
        deceased: ~x"./deceased/text()",
        membership_type:  ~x"./membership_type/text()",
        membership_type_id:  ~x"./membership_type/@id",
        membership_date: ~x"./membership_date/text()",
        membership_end: ~x"./membership_end/text()",
        receive_email_from_church: ~x"./receive_email_from_church/text()",
        default_new_group_messages: ~x"./default_new_group_messages/text()",
        default_new_group_comments: ~x"./default_new_group_comments/text()",
        default_new_group_digest: ~x"./default_new_group_digest/text()",
        default_new_group_sms: ~x"./default_new_group_sms/text()",
        privacy_settings_profile_listed: ~x"./privacy_settings/profile_listed/text()",
        privacy_settings_mailing_address_id: ~x"./privacy_settings/mailing_address/@id",
        privacy_settings_mailing_address: ~x"./privacy_settings/mailing_address/text()",
        privacy_settings_home_address_id: ~x"./privacy_settings/home_address/@id",
        privacy_settings_home_address: ~x"./privacy_settings/home_address/text()",
        privacy_settings_home_phone_id: ~x"./privacy_settings/home_phone/@id",
        privacy_settings_home_phone: ~x"./privacy_settings/home_phone/text()",
        privacy_settings_work_phone_id: ~x"./privacy_settings/work_phone/@id",
        privacy_settings_work_phone: ~x"./privacy_settings/work_phone/text()",   
        privacy_settings_mobile_phone_id: ~x"./privacy_settings/mobile_phone/@id",
        privacy_settings_mobile_phone: ~x"./privacy_settings/mobile_phone/text()",                
        privacy_settings_emergency_phone_id: ~x"./privacy_settings/emergency_phone/@id",
        privacy_settings_emergency_phone: ~x"./privacy_settings/emergency_phone/text()", 
        privacy_settings_birthday_id: ~x"./privacy_settings/birthday/@id",
        privacy_settings_birthday: ~x"./privacy_settings/birthday/text()", 
        privacy_settings_anniversary_id: ~x"./privacy_settings/anniversary/@id",
        privacy_settings_anniversary: ~x"./privacy_settings/anniversary/text()",
        privacy_settings_gender_id: ~x"./privacy_settings/gender/@id",
        privacy_settings_gender: ~x"./privacy_settings/gender/text()",
        privacy_settings_marital_status_id: ~x"./privacy_settings/marital_status/@id",
        privacy_settings_marital_status: ~x"./privacy_settings/marital_status/text()",
        privacy_settings_user_defined_fields_id: ~x"./privacy_settings/user_defined_fields/@id",
        privacy_settings_user_defined_fields: ~x"./privacy_settings/user_defined_fields/text()",        
        privacy_settings_allergies_id: ~x"./privacy_settings/allergies/@id",
        privacy_settings_allergies: ~x"./privacy_settings/allergies/text()",                
        active: ~x"./active/text()",
        creator: ~x"./creator/text()",
        creator_id: ~x"./creator/@id",
        modifier: ~x"./modifier/text()",
        modifier_id: ~x"./modifier/@id",
        created: ~x"./created/text()",
        modified: ~x"./modified/text()"  
        #user_defined_text_fields
        #user_defined_date_fields
        #user_defined_pulldown_fields        
    )

    CcbApiEx.Model.Individual.from_list(individuals)
  end
end