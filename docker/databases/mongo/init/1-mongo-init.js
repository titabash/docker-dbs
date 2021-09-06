db.auth('root', 'pass')
db = db.getSiblingDB('test')
db.createUser({
  user: 'testUser',
  pwd: 'password',
  roles: [
    {
      role: 'readWrite',
      db: 'test',
    },
  ],
});
db.foo.insert({ x: 1, y: 1 })
