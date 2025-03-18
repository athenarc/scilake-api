def get_graphiql_html():
    with open("app/graphiql_template.html", "r") as file:
        return file.read()
