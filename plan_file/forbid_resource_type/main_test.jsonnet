// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.json',
    param: {
      config: {
        types: ['google_secret_manager_secret_version'],
      },
    },
    result: [],
  },
  {
    name: 'types is required',
    data_file: 'testdata/fail.json',
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "types" is required',
      },
    ],
  },
  {
    name: 'The config "types" must be an array',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        types: 'hello',
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "types" must be an array',
        custom: {
          types: 'hello',
        },
      },
    ],
  },
  {
    name: 'The config "types" must be an array of string',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        types: [1],
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "types" must be an array of string',
        custom: {
          types: [1],
        },
      },
    ],
  },
  {
    name: 'google_secret_manager_secret_version is forbidden',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        types: ['google_secret_manager_secret_version'],
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        location: {
          address: 'google_secret_manager_secret_version.secret-version-basic',
          type: 'google_secret_manager_secret_version',
        },
      },
    ],
  },
]
