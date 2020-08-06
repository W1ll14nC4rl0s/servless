async function handler(event, context){
    console.log('Invariment', JSON.stringify(process.env, null, 2 ))
    console.log('Event...', JSON.stringify(event, null, 2))

    return {
        hello: "word"
    }
}

module.exports = {
    handler
}