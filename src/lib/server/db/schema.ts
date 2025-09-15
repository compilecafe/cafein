import { pgTable, varchar, pgEnum } from 'drizzle-orm/pg-core';
import { createId } from '@paralleldrive/cuid2';
import { timestamps } from './helpers';

export const userStatusEnum = pgEnum('status', ['active', 'inactive']);

export const usersTable = pgTable('users', {
	id: varchar('id', { length: 128 })
		.$defaultFn(() => createId())
		.primaryKey(),
	avatar: varchar('password'),
	username: varchar('username', { length: 30 }).unique(),
	password: varchar('password'),
	name: varchar('name').$defaultFn(() => 'user_' + Math.random().toString(36).slice(2, 10)),
	status: userStatusEnum().default('active'),
	...timestamps
});

export type SelectUser = typeof usersTable.$inferSelect;
export type InsertUser = typeof usersTable.$inferInsert;
