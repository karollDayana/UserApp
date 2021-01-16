class Consulta {
  static String getUser = """
    query{
      users (options:{
        paginate:{
          limit:10
        }
      }){
        data{
          name
          email
          albums (options:{
            paginate:{
              limit: 1
            }
          }){
            data{
              photos (options:{
            paginate:{
              limit: 1
            }
          }){
              data{
                url
              }
            }
          }
        }
        }
      }
    }
    """;

    static String userLogin = """
      query{
        user(id: 1){
          id
          username
          phone
        }
      }
    """;
}
