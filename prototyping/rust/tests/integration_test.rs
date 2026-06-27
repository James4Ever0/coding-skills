use prototype::core::Result;

#[test]
fn test_result_integration() {
    let r = Result::new(true, "integration test");
    assert!(r.success);
    assert_eq!(r.message, "integration test");
}

#[test]
fn test_validate_name_integration() {
    let r = prototype::validate_name("my-skill");
    assert!(r.success);
}
