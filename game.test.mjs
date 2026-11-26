import test from 'node:test';
import assert from 'node:assert/strict';
import {QUESTIONS,CATEGORIES,chooseRound} from './game.mjs';

test('question bank has no arithmetic category or numeric problem prompts',()=>{
 assert.equal(CATEGORIES.includes('Math'),false);
 assert.ok(QUESTIONS.length>=49);
 assert.ok(QUESTIONS.every(q=>!/(what is|calculate)\s+\d+\s*[+*/-]/i.test(q.q)));
});
test('each category can produce a seven-question round',()=>{
 for(const category of CATEGORIES.filter(c=>c!=='All')){
  const round=chooseRound(category,()=>0.37);
  assert.equal(round.length,7,category);
  assert.ok(round.every(q=>q.category===category));
  assert.equal(new Set(round.map(q=>q.q)).size,7);
 }
});
test('mixed round contains seven unique questions from the bank',()=>{
 const round=chooseRound('All',()=>0.23);
 assert.equal(round.length,7);
 assert.equal(new Set(round.map(q=>q.q)).size,7);
 assert.ok(round.every(q=>QUESTIONS.includes(q)));
});
test('unknown category safely returns an empty set',()=>{
 assert.deepEqual(chooseRound('Unknown'),[]);
});
