# setting up the communication with the server
import requests
server = 'http://[::]:9000/'
annotators  = 'tokenize, ssplit, pos, lemma, depparse, ner, coref'
properties = '?properties={"annotators":"' + annotators + '","outputFormat":"json"}'

from os import listdir
data_folder_fp = 'nlp-papers/txts/' # change this to your filepath to the plain text files
data_fps = listdir(data_folder_fp)

# creating the graph
from cog.torque import Graph
g = Graph(data_folder_fp.split('/')[0])

nodes, edges = [], []

# processing the files
for data_fp in data_fps:
    f = open(data_folder_fp + data_fp)
    txt = f.read()
    f.close()
    sentences = txt.split('.')
    
    # output the current file we're working on
    print('Working on ', data_folder_fp + data_fp, '...')

    # we separate our paragraphs into 10 sentences, and send them to the CoreNLP server
    for index in range(0, len(sentences), 10):
        paragraph = ''.join(sentences[index:index + 10])
        nlp = requests.post(server + properties, data = {'data':paragraph}).json()

        for sentence in nlp['sentences']:
            parseTree = sentence['basicDependencies']
            sub, vrb, obj = '', '', ''

            # we go trough the dependencies, looking for subject and object
            for dependency in parseTree:
                if dependency['dep'] == 'nsubj':
                    sub = dependency
                if dependency['dep'] == 'obl':
                    obj = dependency

            # we look at the dependecy linking the subject to the verb, but only if
            # there are both subject and object in this sentence
            if sub != '' and obj != '':
                try:
                    vrb = parseTree[sub['governor']]
                except IndexError:
                    continue

            # if there is a verb that relates the subject to the object, we add
            # the appropriate SVO triplet to the database
            if vrb != '':
                svo = ['', '', '']
                # remember, we're extracting the lemmas for our words
                for token in sentence['tokens']:
                    if token['originalText'] == sub['dependentGloss']:
                        svo[0] = token['lemma']
                    if token['originalText'] == vrb['dependentGloss']:
                        svo[1] = token['lemma']
                    if token['originalText'] == obj['dependentGloss']:
                        svo[2] = token['lemma']
                # adding the SVO triplet to the graph
                g.put(svo[0], svo[1], svo[2])
                # calculating the metrics
                nodes.append(svo[0])
                nodes.append(svo[2])
                edges.append(svo[1])

# output the needed metrics
nodes = set(nodes)
print('Total nodes = ', len(nodes))
print('Total edges = ', len(edges))
edges = set(edges)
print('Total unique edges = ', len(edges))

# visualize the knowledge graph
g.v().tag('from').out().tag('to').view('follows').url
# to see the results, open the provided .html file with your browser
