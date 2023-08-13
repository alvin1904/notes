> Using useReducer instead of useState

```
import { useReducer, useState } from 'react'
```

```
function EditCalendarEvent() {
  const [event, updateEvent] = useReducer((prev, next) => {
    return { ...prev, ...next }
  }, { title: '', description: '', attendees: [] })

  return <>
    <input value={event.title}
      onChange={e => updateEvent({ title: e.target.value }) } />
    {/* ... */}
  </>
}
```

It provides critical benefit of useReducer — the ability to supply a function that controls state transitions.

Going back to using useReducer, the only difference is you get an additional argument that is a function that can help us ensure that each state transition is safe and valid.

```
  const [event, updateEvent] = useReducer(
    (prev, next) => {
      const newEvent = { ...prev, ...next };

      // Ensure that the start date is never after the end date
      if (newEvent.startDate > newEvent.endDate) {
        newEvent.endDate = newEvent.startDate;
      }

      // Ensure that the title is never more than 100 chars
      if (newEvent.title.length > 100) {
        newEvent.title = newEvent.title.substring(0, 100);
      }
      return newEvent;
    },
    { title: "", description: "", attendees: [] }
  );
```

```
function Counter() {
  const [count, setCount] = useState(0);
  return {statement}
  );
}
```

```
function Counter() {
  const [count, setCount] = useReducer((prev, next) => Math.min(next, 10), 0);
  return (
    <button onClick={() => setCount(count + 1)}>
      Count is {count}
    </button>
  );
}
```
