# TernConverter.py
import sys
import json


def parseJSDocJson(hifiAPI):
    ternHifiJson = {}
    ternHifiJson['!name'] = 'HighFidelity'
    for entry in hifiAPI:
        kind = entry['kind']
        if kind == 'namespace':
            apiName = entry['name']
            ternHifiJson[apiName] = {}
            print(apiName)
            if entry.get('properties'):
                for property in entry['properties']:
                    propertyName = property['name']
                    propertyType = property['type']['names'][0]
                    api = ternHifiJson[apiName]
                    api[propertyName] = propertyType

    for entry in hifiAPI:
        kind = entry['kind']
        if kind == 'function':
            apiName = entry['memberof']
            if not ternHifiJson.get(apiName):
                ternHifiJson[apiName] = {}
            api = ternHifiJson[apiName]
            functionName = entry['name']

            params = ''
            if entry.get('params'):
                for param in entry['params']:
                    paramName = ''
                    if param.get('name'):
                        paramName = param['name']

                    paramType = 'Object'
                    if param.get('type'):
                        paramType = param['type']['names'][0]

                    params += paramName + ': ' + paramType + ', '

            print('before: ' + params);
            if params.endswith(', '):
                params = params[:-2]
            print('after: ' + params);
            print('\n')

            returns = 'void'
            if entry.get('returns'):
                returns = entry['returns'][0]['type']['names'][0]

            function = 'fn(' + params + ') -> ' + returns
            api[functionName] = function
    print('\n')
    return ternHifiJson


def main():
    argsLength = len(sys.argv)
    if argsLength == 3:
        inputFile = sys.argv[1]
        outFile = sys.argv[2]

        rawData = open(inputFile)
        jsonData = json.load(rawData)

        ternJson = parseJSDocJson(jsonData)

        # write out to file

        with open(outFile, 'w') as output:
            json.dump(ternJson, output, sort_keys=True, indent=4, separators=(',', ': '))


main()
