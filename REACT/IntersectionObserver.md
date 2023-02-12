const targetRef = useRef(null); // refers to the element in focus
const [aboutVisible, setAboutVisible] = useState(false);

const callbackFunction = (entries) => {
const [entry] = entries;
setAboutVisible(entry.isIntersecting);
};
const options = useMemo(() => {
return { root: null, rootMargin: "0px", threshold: 0.3 };
}, []);
useEffect(() => {
const observer = new IntersectionObserver(callbackFunction, options);
const currentTarget = targetRef.current;
if (currentTarget) observer.observe(currentTarget);
//CLEANUP FUNCTION
return () => {
if (currentTarget) observer.unobserve(currentTarget);
};
}, [targetRef, options]);
