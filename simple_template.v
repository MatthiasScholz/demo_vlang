fn build() string {
	name := 'Peter'
	age := 25
	numbers := [1, 2, 3]
  // NOTE: Path is hard codeded because the template is included during build time.
	return $tmpl('simple.template')
}

fn main() {
	println(build())
}
