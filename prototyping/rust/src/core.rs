/// Reference: prototyping/python/logic/core.py
/// Core domain logic for prototypes.

/// Result represents the outcome of a prototype operation.
#[derive(Debug, PartialEq)]
pub struct Result {
    pub success: bool,
    pub message: String,
}

impl Result {
    pub fn new(success: bool, message: &str) -> Self {
        Result {
            success,
            message: message.to_string(),
        }
    }
}

/// Validate that a skill name contains only letters, digits, and hyphens.
pub fn validate_name(name: &str) -> Result {
    if name.is_empty() {
        return Result::new(false, "Name cannot be empty");
    }
    if name.contains(' ') {
        return Result::new(false, "Name cannot contain spaces");
    }
    for c in name.chars() {
        if !c.is_alphanumeric() && c != '-' {
            return Result::new(false, "Name can only contain letters, digits, and hyphens");
        }
    }
    Result::new(true, "Name is valid")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_validate_name_valid() {
        let r = validate_name("my-skill");
        assert!(r.success);
        assert_eq!(r.message, "Name is valid");
    }

    #[test]
    fn test_validate_name_empty() {
        let r = validate_name("");
        assert!(!r.success);
        assert_eq!(r.message, "Name cannot be empty");
    }

    #[test]
    fn test_validate_name_with_spaces() {
        let r = validate_name("my skill");
        assert!(!r.success);
    }

    #[test]
    fn test_validate_name_special_chars() {
        let r = validate_name("my_skill!");
        assert!(!r.success);
    }

    #[test]
    fn test_result_new() {
        let r = Result::new(true, "test");
        assert!(r.success);
        assert_eq!(r.message, "test");
    }

    #[test]
    fn test_result_new_failure() {
        let r = Result::new(false, "fail");
        assert!(!r.success);
    }
}
