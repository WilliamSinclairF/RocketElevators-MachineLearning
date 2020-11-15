# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks 

#    task :dropbox => :environment do
#         # Customer.all.each do |customer|            
#         #     print "Customer.user_id = "
#         #     puts customer.user_id           
#         # end  
        
#         client = DropboxApi::Client.new(DROPBOX_OAUTH_BEARER)
#         Lead.all.each do |lead|
#             if lead.attachment != nil
#                 #print "Lead.user_id = "
#                 #puts lead.user_id
#                 Customer.all.each do |customer|
#                     # print "Customer.user_id = "
#                     # puts customer.user_id  
#                     if lead.user_id == customer.user_id                                                
#                         file_content =  lead.attachment.read                        
#                         file_extension = File.extname(lead.attachment.to_s) 
#                         file_name = "/file" + lead.id.to_s  + file_extension
#                         puts file_name
#                         client.upload file_name, file_content   
#                     end 
#                 end                     
#             end 
#         end 
#         puts "\n--------Rake task ended well-----------\n"        
#     end  
       
    
    
