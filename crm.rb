require_relative "Contact"

class CRM

  def initialize(contact)
    @contact = contact
  end

  def main_menu
    while true
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
