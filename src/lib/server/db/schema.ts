import { pgTable, varchar, pgEnum, timestamp, boolean } from 'drizzle-orm/pg-core';
import { createId } from '@paralleldrive/cuid2';
import { timestamps } from './helpers';

export const userStatusEnum = pgEnum('status', ['active', 'inactive']);

export const usersTable = pgTable('users', {
	id: varchar('id', { length: 128 })
		.$defaultFn(() => createId())
		.primaryKey(),
	avatar: varchar('avatar'),
	username: varchar('username', { length: 32 }).notNull().unique(),
	password: varchar('password').notNull(),
	name: varchar('name')
		.notNull()
		.$defaultFn(() => 'user_' + Math.random().toString(36).slice(2, 10)),
	status: userStatusEnum().notNull().default('active'),
	...timestamps
});

export type SelectUser = typeof usersTable.$inferSelect;
export type InsertUser = typeof usersTable.$inferInsert;

export const sessionsTable = pgTable('sessions', {
	id: varchar('id', { length: 128 })
		.$defaultFn(() => createId())
		.primaryKey(),
	userId: varchar('user_id', { length: 128 })
		.notNull()
		.references(() => usersTable.id),
	token: varchar('token', { length: 255 }).unique().notNull(),
	userAgent: varchar('user_agent', { length: 255 }),
	ipAddress: varchar('ip_address', { length: 255 }),
	createdAt: timestamp('created_at').defaultNow().notNull(),
	expiresAt: timestamp('expires_at').notNull(),
	revoked: boolean('revoked').notNull().default(false)
});

export type SelectSession = typeof sessionsTable.$inferSelect;
export type InsertSession = typeof sessionsTable.$inferInsert;
