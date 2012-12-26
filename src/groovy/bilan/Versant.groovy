package bilan

enum Versant {
    EXPRESSION('Expression'), COMPREHENSION('Compréhension');

    private String label

    private Versant(String label) {
        this.label = label
    }

    String getLabel() {
        label
    }
}
