$TTL    604800
@       IN      SOA     ns.postfixasor.com. root.postfixasor.com. (
                             2023120903     ; serial
                                 604800     ; refresh in seconds
                                  86400     ; retry
                                2419200     ; expire
                                 604800     ; minimum
)

                     NS      ns ;
ns                   A       192.168.254.91
www                  A       192.168.254.91
postfixasor.com.     A       192.168.254.91

postfixasor.com.     IN      MX      10      mail.postfixasor.com.

pop3            IN      CNAME   postfixasor.com.
smtp            IN      CNAME   postfixasor.com.
mail            IN      CNAME   postfixasor.com.