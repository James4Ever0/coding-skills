package tests

import (
	"testing"

	"prototype/internal"
)

func TestValidateNameValid(t *testing.T) {
	r := internal.ValidateName("my-skill")
	if !r.Success {
		t.Errorf("expected success=true, got false")
	}
	if r.Message != "Name is valid" {
		t.Errorf("expected 'Name is valid', got '%s'", r.Message)
	}
}

func TestValidateNameEmpty(t *testing.T) {
	r := internal.ValidateName("")
	if r.Success {
		t.Errorf("expected success=false, got true")
	}
	if r.Message != "Name cannot be empty" {
		t.Errorf("expected 'Name cannot be empty', got '%s'", r.Message)
	}
}

func TestValidateNameWithSpaces(t *testing.T) {
	r := internal.ValidateName("my skill")
	if r.Success {
		t.Errorf("expected success=false, got true")
	}
}

func TestValidateNameSpecialChars(t *testing.T) {
	r := internal.ValidateName("my_skill!")
	if r.Success {
		t.Errorf("expected success=false, got true")
	}
}

func TestNewResult(t *testing.T) {
	r := internal.NewResult(true, "test")
	if !r.Success {
		t.Errorf("expected success=true, got false")
	}
	if r.Message != "test" {
		t.Errorf("expected message='test', got '%s'", r.Message)
	}
}

func TestNewResultFailure(t *testing.T) {
	r := internal.NewResult(false, "fail")
	if r.Success {
		t.Errorf("expected success=false, got true")
	}
}
