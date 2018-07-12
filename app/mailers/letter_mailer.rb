class LetterMailer < ApplicationMailer

 def letter_mail(letter)
   @letter = letter
   mail to: User.find_by(id: letter.user_id).email, subject: "確認メール"
 end
end
