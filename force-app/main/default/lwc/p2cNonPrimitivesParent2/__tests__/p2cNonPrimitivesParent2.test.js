import { createElement } from 'lwc';
import P2cNonPrimitivesParent2 from 'c/p2cNonPrimitivesParent2';

describe('c-p2-c-non-primitives-parent2', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-p2-c-non-primitives-parent2', {
            is: P2cNonPrimitivesParent2
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});