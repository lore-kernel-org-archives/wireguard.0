Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05654C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Nov 2021 18:54:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d89f473d;
	Fri, 26 Nov 2021 18:52:15 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 039eb52b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Nov 2021 18:52:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Xy0n3l71BqjtrLF0YjLOnygTf4RAXEAo3de0yjxScwhXkf8HO+ptAcNGAHwIvhREeILYkPyLqhyoSMMrFd7imuPHjicrI5h90/aQc/UUVOhuS5Fz/rkz1S8GPu/1245wnFVhDFe/IxC1Cx4HQoJxjh7oqmBp2PLltQf/STzL+bOeaf07BdhhohsthE8WYDzHGFz2sFheUG0zuUzcapV5NsPy2SKt/sOOfm/1l6Y7MzDIRMhp4J4N7cIf/A6ul1GmZ21i3EXCLFykWunjzP/b2SGxg2tLpTOj6qfiRy3t1P2AUAOT820VPpGGaFwUxNRMYA/IM4O/yezYLD7VKS/GKw==;
 s=purelymail1; d=thezest.dev; v=1;
 bh=eY//aaRq3Cm2xffz2kF7DGSqJ7+0VDGtQtQA6NONhV8=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=Gtpu+4xqbD3pRaBXmtW76sgUvPCMkDx8JIqOuGHOVKxCqo8KJt9n8jGF1TXgVcHa/XEhKU4y92OXs8UqWQ00HQdxfa/rjUwZu90ljFMbalY8e0Qj+a0EqJa9Bd08Q8WA4uBo3OtUH83NPIqPia1mgOC5L0KOWJ5yLSKC51mUAQsTkfLDYJ1M1X4NMa8whhhLgOKtSlmCf6mW73MIPJPBWKorClnLfx9XAdr5ix1/z0U0t6OjDYCdh7Qh2PJ0hZndnaCsDVyZ0wAD2Tznq2AnjdvndRzJOmBLv9Sk/kSrqqtlLeraw2YEHA+6UfP2vUfYui7Lls4yiX1eTBY8sV7jdA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eY//aaRq3Cm2xffz2kF7DGSqJ7+0VDGtQtQA6NONhV8=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 1188:367:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-12.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -2141744869; Fri, 26 Nov 2021 18:51:45 +0000 (UTC)
Date: Thu, 25 Nov 2021 13:34:16 +0000
From: Diab Neiroukh <lazerl0rd@thezest.dev>
Subject: Re: [Windows Client] Out of date Title scare my users
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Bruno UT1 <bandry@ut1.org>, wireguard@lists.zx2c4.com
Message-Id: <41R43R.3PB4SBRZN49H2@thezest.dev>
In-Reply-To: <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Dear Bruno,

Whilst I understand the frustration that having hundreds of users can 
cause, I don't believe simply reverting the change [as proposed by 
Jason] is the correct solution. I've come up with a few alternative 
solutions, but before I present them I'd just like to give a brief 
introduction into why I requested that change in the first place.

WireGuard on Windows exclusively provides a GUI to users of the 
Administrators group, as well as a limited GUI to users of the Network 
Configuration Operators group when the `LimitedOperatorUI` DWORD is 
set. The latter is helpful for users who wish to separate their 
personal and administrator accounts (to protect themselves against the 
plethora of UAC exploits, amongst other security issues) where 
otherwise the user would have to switch accounts to switch tunnels. 
However, the GUI shown to Network Configuration Operators lacked any 
information about updates. This lead to users in such setups to not be 
informed about any updates unless they switched out to the 
Administrator account and or kept an eye on the releases online. This 
is quite a problem as users could be running ancient versions of 
WireGuard for relatively long periods of time without the knowledge 
that they are doing so (some users may even assume WireGuard 
automatically updates). As such, I asked Jason if he could add the 
ability for non-admins to at least be informed of an update which lead 
to where we are today.

After speaking to Jason "off the mailing list", he stated he wouldn't 
like to add any more configuration options (via the Registry or within 
the GUI) nor any metadata to updates so bearing that in mind I came up 
with a few alternatives:

1) Rewording the update prompt for non-admins to appear less 
"aggressive". Currently, the prompt is "Please ask the system 
administrator to update." but this could be changed to something along 
the lines of "There is an update available. The system administrator 
will update when necessary." which should reduce most, if not all, 
users from contacting you unnecessarily. I can throw up a patch for 
this if Jason agrees.

2) Avoiding users seeing the UI at all, where unnecessary. If your 
users do not need *control* of the WireGuard configuration, then 
avoiding showing them the UI altogether could be an option. I don't 
know your system as well as you do, of course, so I can't assure that 
this solution is valid. However, having hundreds of users as Network 
Configuration Operators sounds a little "worrying" to me.

3) Showing an even more limited UI for unprivileged users. If the users 
still need some form of UI, then an even more limited UI could be 
presented to users not part of the Administrators nor the Network 
Configuration Operators groups. This would lack any form of control, 
and could still be under the same `LimitedOperatorUI` Registry DWORD, 
or not if is deemed "safe enough for the masses". If it is, you could 
say the semantics refer to "Limited [User or Network] Operator UI".

4) Updates could be hidden from the UI for N days after an update or N 
updates (preferably two in this case, so that it doesn't pile up) for 
Network Configuration Operators. This provides you [and any other 
sysadmins] with a "buffer zone" to apply the updates before users 
contact you about them. This could also be teamed up with 1) to further 
reduce the likelihood of users contacting you. I'm not a large fan of 
this "solution", however, since WireGuard for Windows lacks any 
metadata to differentiate important and optional updates which can lead 
to a security patch or critical bug-fix being ignored for some time.

5) Creating a separate group which are able to switch tunnels. For 
users who just need the GUI to switch tunnels, having a group specific 
to such behaviour named something along the lines of "WireGuard 
Operators" could be helpful.

Hopefully at least one of these suffices for you so that we can meet a 
mid-point of sorts that matches both your criteria as well as my own.

PS: Whilst it may seem a pain, I believe that a balance should be 
achieved between the sysadmins and users where if the former forgets to 
apply an update "for too long" then the users contact them as a 
reminder. After all, we're all humans and we do forget sometimes. The 
solutions 1) - with a prompt such as "There is an update available. The 
system administrator should update soon." - and 4) match up to this 
quite nicely.

Thank for your time,
Diab Neiroukh

On Wed, Nov 24 2021 at 16:42:59 +0100, Jason A. Donenfeld 
<Jason@zx2c4.com> wrote:
> I agree the situation is a bit ridiculous. I'll revert the change that
> added this: 
> https://git.zx2c4.com/wireguard-windows/commit/?id=82129ba288f7561c89bb80e04841ffb46bc29889
> 
> I'm CCing Diab, who originally requested the change, in case he wants
> to argue with you about it. But in the absence of that, I'll revert.


