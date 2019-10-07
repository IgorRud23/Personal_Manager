class Client {
  constructor(id, name, gender, age, weight, height, schedules, user, isInfo){
    this.id = id,
    this.name = name,
    this.gender = gender,
    this.age = age,
    this.weight = weight,
    this.height = height,
    this.schedules = schedules,
    this.user = user,
    this.isInfo = isInfo,
    this.renderClient()
  }

  renderClient(){
    const clientContainer = document.getElementById('clientContainer');
    const clientBox = document.createElement('div');

    clientBox.id = this.id;
    clientBox.innerHTML += this.clientHTML();
    clientContainer.appendChild(clientBox);

    if (!this.isInfo) {
      const deleteBtn = document.getElementById(`${this.id}_button`);
      deleteBtn.addEventListener('click', () => this.deleteClient());
    }
  }

  clientHTML(){
    return `
      <section id="${this.id}_client">
        <h3>${this.name}</h3>

        ${this.isInfo
          ? `<p>Gender: ${this.gender}</p>
            <p>Age: ${this.age} years</p>
            <p>Weight: ${this.weight}</p>
            <p>Height: ${this.height}</p>`
          : ''
        }

        ${!this.isInfo
          ? `
          <button id="${this.id}_button">Delete</button>
          <br/><br/>
          <a href='http://localhost:3000/users/2/clients/${this.id}'> Show INFO</a>
          `
          : ''
        }

        <div>
          ${this.schedules.map(schedule =>
          `
            <h6>Exercise Type: ${schedule.exercise_type}</h6>
            <span>Date: ${new Date(schedule.date_day).toLocaleDateString()}</span>
          `).join('')}
        </div>
        <hr/>
      </section>
    `
  }

  deleteClient(){
    const user_id = document.getElementById('clientContainer').dataset.user_id;

    fetch(`http://localhost:3000/users/${user_id}/clients/${this.id}`, {method: 'DELETE'})
      .then(() => {
        const clientEl = document.getElementById(`${this.id}_client`);
        clientEl.remove();
      })
      .catch(err => {
        console.log(err);
        alert('Has some issues to handle your request.');
      });
  }
}
