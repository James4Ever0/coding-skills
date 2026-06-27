// Reference: prototyping/python/logic/core.py
// Package internal provides core domain logic for prototypes.
package internal

import "strings"

// Result represents the outcome of a prototype operation.
type Result struct {
	Success bool
	Message string
}

// NewResult creates a new Result.
func NewResult(success bool, message string) Result {
	return Result{Success: success, Message: message}
}

// ValidateName checks that a skill name contains only letters, digits, and hyphens.
func ValidateName(name string) Result {
	if name == "" {
		return NewResult(false, "Name cannot be empty")
	}
	if strings.Contains(name, " ") {
		return NewResult(false, "Name cannot contain spaces")
	}
	for _, c := range name {
		if !isAlphanumericOrHyphen(c) {
			return NewResult(false, "Name can only contain letters, digits, and hyphens")
		}
	}
	return NewResult(true, "Name is valid")
}

func isAlphanumericOrHyphen(c rune) bool {
	return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '-'
}
