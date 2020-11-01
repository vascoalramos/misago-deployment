import React from "react"

export default function({ category, className }) {
  if (!category) return null

  if (category.css_class) {
    className += " thread-detail-category-" + category.css_class
  }

  return (
    <a className={className} href={category.url.index}>
      {category.name}
    </a>
  )
}
