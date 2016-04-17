import gi
gi.require_version('Notify', '0.7') 
from gi.repository import Notify
import sys

argin = sys.argv
option = argin[1]
if option == 'success':
    link = argin[2]

if option == 'success':
    message = "Screenshot ready at the link "+str(link)
    Notify.init ("mypuush : Screenshot link in clip")
    notification=Notify.Notification.new ("mypuush : Screenshot link in clip",
                                message, 
                                str(link))
    notification.show ()

elif option == 'empty':   
    message = "Your link is empty. This should NOT happend. Maybe you modified something in the code? Try to re-download mypuush"
    Notify.init ("mypuush : No link has been found")
    notification=Notify.Notification.new ("mypuush : No link has been found",
                                message,
                                "")
    notification.show ()

elif option == 'noclient':
    message = "Unable to connect to the Imgur API.. Are you connected to the Internet? If so, check the credentials"
    Notify.init ("mypuush : Impossible to connect")
    notification=Notify.Notification.new ("mypuush : Impossible to connect",
                                message,
                                "")
    notification.show ()

elif option == 'uploadfail':
    message = "Woops.. The upload failed. Be sure not to add silly options to the screenshot config. As an example, you can't add an album name to your screenshot. Trust me."
    Notify.init ("mypuush : Upload failed")
    notification=Notify.Notification.new ("mypuush : Upload failed",
                                message,
                                "")
    notification.show ()

elif option == 'nofile':
    message = "Be careful!! Your screenshot was not taken.. (File does not exist). Maybe you pressed ESCAPE when you shouldn't. If not, you may have used an invalid argument (remember not to us the -f option)"
    Notify.init ("mypuush : File does not exist")
    notification=Notify.Notification.new ("mypuush : File does not exist",
                                message,
                                "")
    notification.show ()

elif option == 'norecover':
    message = "Your link file does not exist. If it does, check the path of your tmp files"
    Notify.init ("mypuush : Your link file does not exist")
    notification=Notify.Notification.new ("mypuush : Yourr link file does not exist",
                                message,
                                "")
    notification.show ()

elif option == 'linkfileempty':
    message = "Your linkfile is empty or does not contain the right content. Go check it"
    Notify.init ("mypuush : Your link file is empty")
    notification=Notify.Notification.new ("mypuush : Yourr link file is empty",
                            message,
                            "")
    notification.show ()

else:
    message = "Screenshot ready at the link "+str(link)
    Notify.init ("mypuush : Screenshot link in clip")
    notification=Notify.Notification.new ("mypuush : Screenshot link in clip",
                            message,
                            str(link))
    notification.show ()

print(message)
