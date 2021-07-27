
const String Login_queryString = r"""
          
          mutation login_request ($email: String!, $password: String!) {
              login(data: { email: $email, password: $password } ) {
                token
                id
                username
                name
                email
              }
            }
          
      """;

const String UserDetails_queryString = r"""

              query {
                  me {
                      id
                      username
                      name
                      email
                      token
                      status
                      privileges
                      createdAt
                      updatedAt
                      token
                      managedPortfolios{
                          id
                          name
                          description
                          managers{
                              id
                          }
                      }
                      microFundOrders{
                          id
                          orderType
                          limit
                      }
                    
                      deposits {
                          id
                      }
                  }
              }
          
      """;

const String T_UserDetails_queryString = r"""
          
              query {
                user (id:"ckmk9u1y40000bzvgx26lxoqf") {
                  id
                  name
                }
              }
          
      """;
