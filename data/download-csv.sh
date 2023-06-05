
source env/project-env.sh

cd $WORKDIR
echo "SELECT code,shortname,component_code,component_class,component_name,variable,characteristic,value,dam_version 
FROM dam_components 
LEFT JOIN functional_groups 
    USING (code) 
WHERE code like '%F%' 
    AND dam_version NOT IN ('self','ignore') 
ORDER BY component_class,variable,code " > qry

psql -h $DBHOST -U $DBUSER -d $DBNAME --file=qry --csv > dam_components_freshwater_results.csv

