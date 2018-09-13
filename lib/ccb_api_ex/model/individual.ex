defmodule CcbApiEx.Model.Individual do

  alias CcbApiEx.Model.Address
  alias CcbApiEx.Model.Phone

  defstruct id: nil,
    sync_id: nil,
    other_id: nil,
    campus_id: nil,
    campus: nil,
    family_id: nil,
    family: nil,
    family_image: nil,
    family_position: nil,
    first_name: nil,
    last_name: nil,
    middle_name: nil,
    legal_first_name: nil,
    full_name: nil,
    salutation: nil,
    suffix: nil,
    image: nil,
    email: nil,
    allergies: nil,
    confirmed_no_allergies: nil,
    addresses: nil,
    phones: nil,
    mobile_carrier: nil,
    gender: nil,
    marital_status: nil,
    birthday: nil,
    anniversary: nil,
    baptized: nil,
    deceased: nil,
    membership_type: nil,
    membership_type_id: nil,
    membership_date: nil,
    membership_end: nil,
    receive_email_from_church: nil,
    default_new_group_messages: nil,
    default_new_group_comments: nil,
    default_new_group_digest: nil,
    default_new_group_sms: nil,
    privacy_settings_profile_listed: nil,
    privacy_settings_mailing_address_id: nil,
    privacy_settings_mailing_address: nil,
    privacy_settings_home_address_id: nil,
    privacy_settings_home_address: nil,
    privacy_settings_home_phone_id: nil,
    privacy_settings_home_phone: nil,
    privacy_settings_work_phone_id: nil,
    privacy_settings_work_phone: nil,
    privacy_settings_mobile_phone_id: nil,
    privacy_settings_mobile_phone: nil,
    privacy_settings_emergency_phone_id: nil,
    privacy_settings_emergency_phone: nil,
    privacy_settings_birthday_id: nil,
    privacy_settings_birthday: nil,
    privacy_settings_anniversary_id: nil,
    privacy_settings_anniversary: nil,
    privacy_settings_gender_id: nil,
    privacy_settings_gender: nil,
    privacy_settings_marital_status_id: nil,
    privacy_settings_marital_status: nil,
    privacy_settings_user_defined_fields_id: nil,
    privacy_settings_user_defined_fields: nil,
    privacy_settings_allergies_id: nil,
    privacy_settings_allergies: nil,
    active: nil,
    creator: nil,
    creator_id: nil,    
    modifier: nil,
    modifier_id: nil,
    created: nil,
    modified: nil,
    type: nil #from family model

  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end    
  end

  def from(map) do
    birthday = if map[:birthday] != nil do
      NaiveDateTime.from_iso8601("#{map[:birthday]}")
    else
      {:ok, map[:birthday]}
    end

    {:ok, anniversary} = if map[:anniversary] != nil do
      NaiveDateTime.from_iso8601("#{map[:anniversary]}")
    else
      {:ok, map[:anniversary]}
    end

    {:ok, membership_date} = if map[:membership_date] != nil do
      NaiveDateTime.from_iso8601("#{map[:membership_date]}")
    else
      {:ok, map[:membership_date]}
    end    

    {:ok, membership_end} = if map[:membership_end] != nil do
      NaiveDateTime.from_iso8601("#{map[:membership_end]}")
    else
      {:ok, map[:membership_end]}
    end  

    {:ok, modified} = if map[:modified] != nil do
      NaiveDateTime.from_iso8601("#{map[:modified]}")
    else
      {:ok, map[:modified]}
    end

    {:ok, created} = if map[:created] != nil do
      NaiveDateTime.from_iso8601("#{map[:created]}")
    else
      {:ok, map[:created]}
    end

    %CcbApiEx.Model.Individual{
      id: map[:id],
      sync_id: map[:sync_id],
      other_id: map[:other_id],
      campus_id: map[:campus_id],
      campus: map[:campus],
      family_id: map[:family_id],
      family: map[:family],
      family_image: map[:family_image],
      family_position: map[:family_position],
      first_name: map[:first_name],
      last_name: map[:last_name],
      middle_name: map[:middle_name],
      legal_first_name: map[:legal_first_name],
      full_name: map[:full_name],
      salutation: map[:salutation],
      suffix: map[:suffix],
      image: map[:image],
      email: map[:email],
      allergies: map[:allergies],
      confirmed_no_allergies: map[:confirmed_no_allergies],
      addresses: Address.from_list(map[:addresses]),
      phones: Phone.from_list(map[:phones]),
      mobile_carrier: map[:mobile_carrier],
      gender: map[:gender],
      marital_status: map[:marital_status],
      birthday: birthday,
      anniversary: anniversary,
      baptized: map[:baptized],
      deceased: map[:deceased],
      membership_type: map[:membership_type],
      membership_type_id: map[:membership_type_id],
      membership_date: membership_date,
      membership_end: membership_end,
      receive_email_from_church: map[:receive_email_from_church],
      default_new_group_messages: map[:default_new_group_messages],
      default_new_group_comments: map[:default_new_group_comments],
      default_new_group_digest: map[:default_new_group_digest],
      default_new_group_sms: map[:default_new_group_sms],
      privacy_settings_profile_listed: map[:privacy_settings_profile_listed],
      privacy_settings_mailing_address_id: map[:privacy_settings_mailing_address_id],
      privacy_settings_mailing_address: map[:privacy_settings_mailing_address],
      privacy_settings_home_address_id: map[:privacy_settings_home_address_id],
      privacy_settings_home_address: map[:privacy_settings_home_address],    
      privacy_settings_home_phone_id: map[:privacy_settings_home_phone_id],
      privacy_settings_home_phone: map[:privacy_settings_home_phone],
      privacy_settings_work_phone_id: map[:privacy_settings_work_phone_id],
      privacy_settings_work_phone: map[:privacy_settings_work_phone],      
      privacy_settings_mobile_phone_id: map[:privacy_settings_mobile_phone_id],
      privacy_settings_mobile_phone: map[:privacy_settings_mobile_phone],
      privacy_settings_emergency_phone_id: map[:privacy_settings_emergency_phone_id],
      privacy_settings_emergency_phone: map[:privacy_settings_emergency_phone],
      privacy_settings_birthday_id: map[:privacy_settings_birthday_id],
      privacy_settings_birthday: map[:privacy_settings_birthday],
      privacy_settings_anniversary_id: map[:privacy_settings_anniversary_id],
      privacy_settings_anniversary: map[:privacy_settings_anniversary],   
      privacy_settings_gender_id: map[:privacy_settings_gender_id],
      privacy_settings_gender: map[:privacy_settings_gender],
      privacy_settings_marital_status_id: map[:privacy_settings_marital_status_id],
      privacy_settings_marital_status: map[:privacy_settings_marital_status],
      privacy_settings_user_defined_fields_id: map[:privacy_settings_user_defined_fields_id],
      privacy_settings_user_defined_fields: map[:privacy_settings_user_defined_fields_id],
      privacy_settings_allergies_id: map[:privacy_settings_allergies_id],
      privacy_settings_allergies: map[:privacy_settings_allergies_id],
      active: map[:active],
      creator: map[:creator],
      creator_id: map[:creator_id],
      modifier: map[:modifier],
      modifier_id: map[:modifier_id],
      created: created,
      modified: modified,
      type: map[:type]
    }
  end
end