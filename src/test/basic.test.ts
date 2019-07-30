import { firstFunction } from '../index';

describe('this application', () => {
  test('should return hello world', () => {
    expect(firstFunction()).toEqual('hello world!');
  });
});
