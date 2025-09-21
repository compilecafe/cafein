import { UAParser } from 'ua-parser-js';

export const ua = (userAgent: string) => {
	return UAParser(userAgent);
};
