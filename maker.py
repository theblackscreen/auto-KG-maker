data_fp = 'input.txt'
txt = open(data_fp).read()
sentences = txt.split('.')

import requests
server = 'http://[::]:9000/'
properties = '?properties={"annotators":"tokenize,ssplit,pos","outputFormat":"json"}'

def get_svo_triplet(nlp_json):
    root = nlp_json['root']
    sub = root['nsub']
    obj = root['nob']
    return (sub, root, obj)

from cog.torque import Graph
g = Graph('nlp')

def add_svo(svo):
    g.put(svo)

for sentence in sentences:
    nlp = requests.post(server + properties, data = {'data':sentence})
    svo = get_svo_triplet(nlp)
    add_svo(svo)

# visualize the graph    
g.v().view('').url
