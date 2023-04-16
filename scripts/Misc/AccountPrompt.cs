using Server.Accounting;
using System;

namespace Server.Misc
{
    public class AccountPrompt
    {
        public static void Initialize()
        {
            if (Accounts.Count == 0 && !Core.Service)
            {
                string username = System.Environment.GetEnvironmentVariable("OWNER_USERNAME");
                string password = System.Environment.GetEnvironmentVariable("OWNER_PASSWORD");

                if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
                {
                    Console.WriteLine("This server has no accounts.");
                    Console.Write("Do you want to create the owner account now? (y/n)");
                    
                    string key = Console.ReadLine();
                    
                    if (key.ToUpper() == "Y")
                    {
                        Console.WriteLine();
                        
                        Console.Write("Username: ");
                        username = Console.ReadLine();
                        
                        Console.Write("Password: ");
                        password = Console.ReadLine();
                    }
                    else
                    {
                        Console.WriteLine();
                        
                        Console.WriteLine("Account not created.");

                        return;
                    }
                }

                _ = new Account(username, password)
                {
                    AccessLevel = AccessLevel.Owner
                };
                
                Console.WriteLine("Account created.");
            }
        }
    }
}
