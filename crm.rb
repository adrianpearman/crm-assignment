require_relative "contact.rb"

class CRM

  def initialize
    # @contact = contact
    @run = true
  end

  def main_menu
    while @run == true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(option)
    case option
    when 1
      add_new_contact
    when 6
      @run = false
    end
  end

  def call_option(selection)
    case selection
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit(true)
    end
  end

  def add_new_contact
    puts "Please enter your first name"
    first_name = gets.chomp

    puts "Please enter your last name"
    last_name = gets.chomp

    puts "If you have an email,please enter here"
    email = gets.chomp

    puts "if you'd like, please enter a note about yourself"
    note = gets.chomp

    contact = Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "please enter the contact id"
    contact = gets.chomp.to_i


  end

  def delete_contact
    puts "What contact id would you like to delete?"
    contact_id = gets.chomp
    contact = contact.find_by(contact_id)
    contact.delete
  end

  def display_all_contacts
    display_contacts = Contact.all
    display_contacts.each do |contact|
      puts "ID #{contact.id}"
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
  end

  def search_by_attribute

  end
end
end

crm = CRM.new
crm.print_main_menu
crm.delete_contact
