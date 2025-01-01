"use client";

import { useMemo } from "react";
import { cn } from "@/lib/utils";

interface CodeEditorProps {
  code: string;
}

export function CodeEditor({ code }: CodeEditorProps) {
  const highlightedCode = useMemo(() => {
    // Keywords to highlight
    const keywords = [
      "function",
      "return",
      "if",
      "else",
      "for",
      "while",
      "const",
      "let",
      "var",
      "import",
      "export",
      "default",
      "class",
      "extends",
      "new",
      "this",
      "super",
      "try",
      "catch",
      "finally",
      "throw",
      "async",
      "await",
    ];

    // String literal regex
    const stringLiteral = /"[^"]*"|'[^']*'/g;

    // Comment regex
    const comments = /\/\/.*/g;

    // Function declaration regex
    const functionDeclaration = /\b\w+(?=\s*\()/g;

    // Split the code into lines for proper formatting
    return code.split("\n").map((line, lineIndex) => {
      let segments: { text: string; type?: string }[] = [{ text: line }];

      // Helper function to apply highlighting
      const applyHighlighting = (regex: RegExp, type: string) => {
        segments = segments.flatMap((segment) => {
          if (!segment.type) {
            const parts = segment.text.split(regex);
            const matches = segment.text.match(regex) || [];
            const result: { text: string; type?: string }[] = [];
            
            parts.forEach((part, index) => {
              if (part) result.push({ text: part });
              if (index < matches.length) {
                result.push({ text: matches[index], type });
              }
            });
            
            return result;
          }
          return [segment];
        });
      };

      // Apply different highlighting patterns
      applyHighlighting(new RegExp(keywords.join("|"), "g"), "keyword");
      applyHighlighting(stringLiteral, "string");
      applyHighlighting(comments, "comment");
      applyHighlighting(functionDeclaration, "function");

      return (
        <div key={lineIndex} className="whitespace-pre">
          {segments.map((segment, index) => (
            <span
              key={index}
              className={cn({
                "text-blue-500 dark:text-blue-400": segment.type === "keyword",
                "text-green-500 dark:text-green-400": segment.type === "string",
                "text-gray-500 dark:text-gray-400": segment.type === "comment",
                "text-purple-500 dark:text-purple-400": segment.type === "function",
              })}
            >
              {segment.text}
            </span>
          ))}
        </div>
      );
    });
  }, [code]);

  return (
    <div className="w-full h-[500px] rounded-md border border-input bg-background px-3 py-2 font-mono text-sm overflow-auto">
      {highlightedCode}
    </div>
  );
}
