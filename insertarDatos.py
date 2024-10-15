from cassandra.cluster import Cluster
import pandas as pd
cluster = Cluster(['127.0.0.1'], port=7001) 
session = cluster.connect('universia_keyspace')

df = pd.read_excel('postulaciones.xlsx')

for index, row in df.iterrows():
    query = """
        INSERT INTO postulantes_por_carrera (carrera, periodo, cedula, estado, facultad, puntaje_psu)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
    session.execute(query, (row['CARRERA'], int(row['PERIODO']), row['CEDULA'], row['REGION'], row['FACULTAD'], int(row['PSU_PROMLM'])))

print("Datos insertados con éxito")
