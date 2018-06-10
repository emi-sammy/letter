module LettersHelper
  
   def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_letters_path
    elsif action_name == 'edit'
      letter_path
    end
   end
end
