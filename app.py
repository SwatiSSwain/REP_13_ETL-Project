# import necessary libraries
from flask import Flask, render_template, request, redirect
import psycopg2

# Create Engine for employee db
conn = psycopg2.connect(host="localhost", port = 5432, database="Minneapolis_Police_Force_db")

# Create a cursor object
cur = conn.cursor()

# create instance of Flask app
app = Flask(__name__)

# Set variables

#Fetch all neighborhood names 
cur.execute("SELECT name FROM neighborhood ORDER BY name;")

#Convert list of neighborhood names to a dixtionary
columns = [col[0] for col in cur.description]
neighborhood = [dict(zip(columns, row)) for row in cur.fetchall()]

# create route that renders index.html template
@app.route("/", methods=['GET', 'POST'])
def echo():
    #reroute to new neighborhood url based on form input from user
    if request.method == 'POST':
        newNeighborhood = request.form['neighborhood']

        return redirect("/" + newNeighborhood)

    #Column names for 1st table in index page
    columns = ['Year', 'Police Incidents Count', 'Use of Force Cases', '% White Use of Force', '% Of Color Use of Force', '% White (Demographics)'
                ,'% Of Color (Demographics)', 'Median Household Income']

    #Query 1st table in index page
    cur.execute("SELECT incident_year, cases_count, police_use_of_force_pct, pct_white_use_of_force, pct_of_color_use_of_force, white_pct, of_color_pct,\
                 median_income FROM vw_minneapolis_stats ORDER BY incident_year;")
    mls = cur.fetchall()

    #Column names for 2nd table in index page
    columns_data1 = ['Neighborhood', 'Use of Force Cases', '% White - Use of Force', '% Of Color - Use of Force','% Race Unknown - Use of Force', '% White (Demographics)'
                ,'% Of Color (Demographics)', 'Median Household Income','Income Group']

    #Query 2nd table in index page
    cur.execute("SELECT neighborhood, total_cases, pct_white, pct_of_color, 100-(pct_white+pct_of_color) AS pct_race_unknown , demo_white_pct,\
                demo_of_color_pct, median_income, income_group FROM vw_police_use_of_force_summary ORDER BY total_cases_int DESC LIMIT 5;")
    use_force= cur.fetchall()

    return render_template("index.html", neighborhood=neighborhood, mls=mls, columns=columns, use_force=use_force, columns_data1=columns_data1)

# Add a new route to display stats for dynamically seleted neighborhood
@app.route("/<neighborhood>")
def neighborhood_data(neighborhood):

    #Column names for table in neighborhood page
    columns_data = ['Year', 'Police Incidents Count', 'Use of Force Cases', '% White Use of Force', '% Of Color Use of Force', '% White (Demographics)'
                ,'% Of Color (Demographics)', 'Median Household Income','Income Group']

    #Query table in neighborhood page
    cur.execute("SELECT incident_year,cases_count,police_use_of_force_cnt,pct_white_use_of_force,pct_of_color_use_of_force,white_pct,of_color_pct,median_income,\
                income_group FROM vw_mls_neighborhood_stats WHERE neighborhood_name =  %s order by incident_year;", ((neighborhood),))
    nhbd = cur.fetchall()
 
    return render_template("neighborhood.html", neighborhood_data=nhbd, columns=columns_data, nbr=neighborhood)


if __name__ == "__main__":
    app.run(debug=True)
