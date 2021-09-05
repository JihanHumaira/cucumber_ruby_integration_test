# frozen_string_literal: true

# csi_squad_based
class LoginPage < SitePrism::Page
    path = '/login'
    set_url(ENV['BASE_URL'] + path)
  
    element :phone_number_text_field, :xpath, '//*[@id="__layout"]/div/div[2]/form/label[1]/span[2]/input'
    element :dweb_contact_us_form_name, '#name'
    element :dweb_contact_us_form_email, '#email'
    element :dweb_contact_us_form_invoice, '#invoice_id'
    element :dweb_contact_us_form_problem_details_field, '#body'
    element :dweb_contact_us_form_send_form_button, '.c-btn.c-btn--red'
    element :mweb_contact_us_form_send_form_button, :xpath,
            '//*[text()="Kirim Pertanyaan"]' && '//*[text()="Kirim"]'
    element :dweb_contact_us_form_cancel_button, '.c-btn.u-mrgn-right--2'
    element :dweb_contact_us_form_attachment_label, :xpath,
            './/*[@id="reskinned_page"]
            /main/div/div[2]/div/form/div[2]/div[6]/div[1]/label'
    element :dweb_contact_us_form_type_booking, '#booking_code'
    element :dweb_contact_us_form_type_transaction, '#transaction_id'
    element :dweb_contact_us_form_type_ticket, '#ticket_id'
    element :dweb_contact_us_form_airline_id, '#airlines_name'
    element :dweb_contact_us_form_depart, '#departure_date'
    element :dweb_contact_us_form_depart_time, '#departure_time'
    element :dweb_contact_us_form_num_passenger, '#passenger_amount'
    element :dweb_contact_us_form_name_of_passenger, '#passenger_names'
    element :back_to_home, :xpath, '//*[text()="Kembali Ke Home"]'
  end
  