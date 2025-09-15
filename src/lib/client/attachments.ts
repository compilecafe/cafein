import type { Attachment } from 'svelte/attachments';
import { getSvgPath } from 'figma-squircle';

export function squircle(radius: number = 12): Attachment {
	return (element) => {
		const el = element as HTMLElement;

		const updateClipPath = () => {
			const width = el.offsetWidth;
			const height = el.offsetHeight;

			const path = getSvgPath({
				width,
				height,
				cornerRadius: radius,
				cornerSmoothing: 1
			});

			el.style.clipPath = `path('${path}')`;
		};

		updateClipPath();

		const observer = new ResizeObserver(() => {
			updateClipPath();
		});

		observer.observe(el);

		return () => observer.disconnect();
	};
}

export const showPassword: Attachment = (element) => {
	const el = element as HTMLElement;

	const input = el.previousElementSibling as HTMLInputElement | null;
	if (!input) return () => {};

	const setState = (state: 'shown' | 'hidden') => {
		el.setAttribute('data-state', state);
		el.querySelectorAll<HTMLElement>('*').forEach((child) => {
			child.setAttribute('data-state', state);
		});
	};

	setState('hidden');

	const toggleHandler = () => {
		if (input.type === 'password') {
			input.type = 'text';
			setState('shown');
		} else {
			input.type = 'password';
			setState('hidden');
		}
	};

	el.addEventListener('click', toggleHandler);

	return () => {
		el.removeEventListener('click', toggleHandler);
	};
};
