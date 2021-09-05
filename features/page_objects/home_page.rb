# frozen_string_literal: true

# csi_squad_based
class HomePage < SitePrism::Page
    path = '/supports/contact_us/{number}/form?'
    set_url(ENV['BASE_URL'] + path)
  
    element :dweb_contact_us_form_problem_title, :xpath,
            './/*[@id="reskinned_page"]/main/div/div[2]/div/div/div/span'
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
  
    def contact_us_form_id(type_of_form, id)
      type_of_forms = type_of_form
      case type_of_forms
      when 'general'
        puts 'general form'
      when 'transaction_id' && 'invoice_id'
        dweb_contact_us_form_type_transaction.set(id)
      when 'booking_id'
        contact_us_booking_id(id)
      end
    end
  
    def contact_us_booking_id(id)
      scroll_down(170)
      dweb_contact_us_form_type_booking.set(id)
      dweb_contact_us_form_airline_id.set('GA')
      dweb_contact_us_form_depart.set('05/08/2017')
      dweb_contact_us_form_depart_time.set('12:30')
      dweb_contact_us_form_num_passenger.set('1')
      dweb_contact_us_form_name_of_passenger.set('Mister Potato')
    end
  
    def contact_us_form_quickbuyer
      dweb_contact_us_form_name.set(ENV['CONTACT_US_QB_NAME'])
      dweb_contact_us_form_email.set(ENV['CONTACT_US_QB_MAIL'])
    end
  
    def attachment_status(attachment_status, message)
      attachment_statuses = attachment_status
      case attachment_statuses
      when 'true'
        send_contact_us_form('true', message)
      else
        send_contact_us_form('false', message)
      end
    end
  
    def send_contact_us_form(attachment, messages)
      scroll_down(400)
      attachments = attachment
      wait_until_dweb_contact_us_form_problem_details_field_visible(wait: 10)
      dweb_contact_us_form_problem_details_field.set(messages)
      if attachments == 'true'
        attach_file('attachment_1', File.absolute_path('
                    ./features/support/image/crushed-boxes.jpg'))
      end
      send_form
    end
  
    def send_form
      scroll_down(300)
      wait_until_dweb_contact_us_form_send_form_button_visible(wait: 10)
      dweb_contact_us_form_send_form_button.click
      sleep 2
      expect(page).to have_text('Laporan Berhasil Terkirim')
    end
  
    def complaint_new(message, type_of_complaint)
      wait_until_dweb_contact_us_form_problem_details_field_visible(wait: 10)
      type_of_complaints = type_of_complaint
      case type_of_complaints
      when 'sub4'
        dweb_contact_us_form_problem_details_field.set(message)
        sleep 3
        dweb_contact_us_form_send_form_button.click
      else
        back_to_contus.click
      end
    end
  end
  