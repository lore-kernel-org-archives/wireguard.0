Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00211CA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2026 17:31:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c1c0817e;
	Tue, 6 Oct 2026 17:31:42 +0000 (UTC)
Received: from mail.philomathiclife.com (mail.philomathiclife.com
 [2607:f2f8:a600:102::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e350f6b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=20260811;
 t=1791307892; x=1791394292; bh=FAR4N3tmV7LRWcB7ekQk5yEssQlRPvfRbP67rTV
 maAQ=; h=in-reply-to:from:references:cc:to:subject:date;
 d=philomathiclife.com; b=k2wTkxef2WTWUSb231ju1lt9cT54/2rhwskpENjON+U0s
 +73bdd0wStWq6uuSmQ1mU+SdK+zBjVQE5S8kJUtrU2/KUlCHkekojsubaI36tuzvoX1Ea0
 8MplF1wPwrqsrHAPbZtFoRwJ/efMmt5Wi+Vo0fxNCmxrK0X8RvYUhDSJnVCGhJOhcFH8Z9
 beZ/fkYklPiPWqdYXuMhkSmmQCtMILy30CxLERCUOAg1bmU0p/GgjqobY9V0gqzioa5pUv
 829wLI8c9OLg5IeHXjBs08ilIATCisjVgZKi5XDs52WMXwo53e0TSMLFvSoeEsursTZljc
 ngywcW7/EOiwbhZlQ==
Received: from laptop.philomathiclife.com (<unknown> [2601:283:4e00:fdd4::2])
 by philomathiclife.com (OpenSMTPD) with ESMTPSA id b4e20f98
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO); 
 Tue, 6 Oct 2026 11:31:32 -0600 (MDT)
Message-ID: <bca3834b-2a26-4a26-9a18-fc1dc9d2326d@philomathiclife.com>
Date: Tue, 6 Oct 2026 11:31:31 -0600
MIME-Version: 1.0
Subject: Re: OpenBSD collaboration/peer-review request
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Matt Dunwoodie <ncon@noconroy.net>
References: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
 <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
 <e1255116-a94f-45a6-9450-f873c0c69ac4@philomathiclife.com>
 <CAHmME9qb8739vLozr56Tzb6R6Cf+heTZNCCu66XSFPMgAc6Z1A@mail.gmail.com>
Content-Language: en-US
From: Zack Newman <zack@philomathiclife.com>
In-Reply-To: <CAHmME9qb8739vLozr56Tzb6R6Cf+heTZNCCu66XSFPMgAc6Z1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 10/6/26 10:02 AM, Jason A. Donenfeld wrote:
> Hi Zack,
> 
> Oh, darn, that's really too bad. I'm CC'ing Matt on the thread; he was
> supposed to be in charge of keeping things sane. I don't like
> throw-it-over-the-fence coding.
> 
> Have you witness insane things happening in the code base? Or are you
> just worried about the churn, in theory, going bad?
> 
> Jason

Hi Jason,

I'm not a C nor kernel developer, and I don't keep track of actual code 
changes. I can't speak about "insane things"; thus I would say I'm 
worried about churn going bad. I also don't want to come off as 
sensationalist. I would be surprised if anything were found that 
constituted as a security issue. I imagine the bugs that exist are 
reliability and compatibility ones.

I can also be idyllic, so perhaps my expectations were unrealistic. I 
understand why you and the team care about how WireGuard is implemented 
because it can give it a bad name when it's done poorly, but I also 
understand the hesitation projects, especially relatively small projects 
like OpenBSD, have of requiring your team's involvement. The idealist in 
me likes code to be peer reviewed and collaboration to occur when 
possible. While I think the quality of code in general is rather high 
for OpenBSD, I don't subscribe to the idea that I should "just trust the 
developers".

You can grok the OpenBSD mail archives and find issues over the last 
five years related to WireGuard. The biggest problems were kernel panics 
caused by mbuf mishandling. What ensued was what I'd personally consider 
a series of hodepodge patches hoping the bugs would be fixed. This is 
pure speculation, but I imagine the devs were hesitant to touch too much 
of the WireGuard code out of fear of mishandling it. Despite being 
somewhat concerned with how these WireGuard issues were handled, I 
selfishly/lazily ignored it since I wasn't obviously impacted (e.g., I 
never experienced kernel panics).

Eventually one of the mbuf experts decided to take a more thorough 
attempt at fixing these issues, and he seemingly fixed the mbuf 
mishandling. Unfortunately by his own admission, he doesn't really use 
WireGuard; and his patch removed the padding "clamp" that would cause 
the MTU to be exceeded. I was affected by this bug and took days to 
figure out what was the culprit. After raising the issue, it was 
suggested to add the clamp when the plaintext was less than or equal to 
the MTU; but no special handling was suggested when the plaintext 
already exceeded the MTU.

Unconvinced by this patch, I consulted the Linux implementation to see 
how it handles that situation and found that it indeed handles that 
situation specially. An LLM-Claude Opus 5.5 if that's relevant-also 
suggested that while Linux consistently uses the same MTU in the 
WireGuard code as the networking stack does when passing the plaintext 
to WireGuard, OpenBSD unconditionally uses the interface's MTU in the 
WireGuard code even though, like Linux, its networking stack uses the 
routing MTU. This causes yet another difference in padding behavior.

Anyway, this is all to say that I personally would have preferred this 
been handled differently. Namely instead of putting off these bugs for a 
more legitimate fix, collaborate with the WireGuard team to ensure 
everything looks good while letting the mbuf experts handle what they're 
comfortable with. For whatever reason it appears no attempts were made 
to collaborate with your team though.

Zack
