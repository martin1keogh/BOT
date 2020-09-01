class EohInterceptor < BaseInterceptor
  def match?
    !!(message =~ /\s*eoh\s*$/i)
  end

  def reply
    if uppercase_message?
      answer.upcase
    else
      answer
    end
  end

  private

  def answer
    if rand_tg
      "TG #{random_victim}"
    else
      hl_user = get_hl_user
      answer = answers.sample
      if hl_user
        hl_user + ", " + answer
      else
        answer.capitalize
      end
    end
  end

  def get_hl_user
    if /^(?<hl_user>[A-Za-z_]+)[,:]/ =~ message
      hl_user
    end
  end

  def answers
    [
      'On se clap au fond svp',
      'On se corn au fond svp',
      'On se clame au fond svp',
      'On se klam au fond svp',
      'On se clape au fond svp',
      'On se skelz0r au fond svp',
      'On se thurolf au fond svp',
      'On se tata au fond svp',
      'Ça coinche au fond svp',
      'C\'est coinché au fond svp',
      'On se stuff au fond svp',
      'On se ghost au fond svp',
      'On se profile au fond svp',
      'On se pakito au fond svp',
      'On se Guinness dans le hall svp',
      'On picole au fond svp',
      'Ça vieillit au fond svp',
      'On se canne au fond svp',
      'Ça compact au fond svp',
      'Ça raclette au fond svp',
      'Ça tartiflette au fond svp',
      'SYRAGE au fond svp',
      'On s\'égare au fond svp',
      'eoh, on rentre du boulot',
      'On se conf au fond svp',
      'Ça picole au Little',
      'On se ramen au fond svp',
      'Ça Gicle au fond svp',
    ]
  end

  def random_victim
    [
      'Amora',
      ['Tata']*5,
      'Skelz0r',
    ].flatten.sample
  end

  def rand_tg
    rand(30) == 1
  end

  def uppercase_message?
    !(message =~ /[[:lower:]]/) # negative match, fail the predicate on the first lowercase character
  end
end
