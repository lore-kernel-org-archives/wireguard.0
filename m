Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B181C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Nov 2021 16:07:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 42bf67c6;
	Thu, 25 Nov 2021 16:07:38 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 154e3681
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 16:07:35 +0000 (UTC)
Received: from [10.172.1.6] (wg-a19600.ut-capitole.fr [10.172.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id 1A42D40BF7A5;
 Thu, 25 Nov 2021 17:07:34 +0100 (CET)
Message-ID: <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
Date: Thu, 25 Nov 2021 17:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Windows Client] Out of date Title scare my users
Content-Language: en-US
To: lazerl0rd@thezest.dev, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
 <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
From: Bruno UT1 <bandry@ut1.org>
In-Reply-To: <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Diab,

Thank you for the detailed explanation.

My suggestion to add a new registry key seemed easy, but I understand a 
limited number of options is important.

 From your alternatives :

1) Probably the easiest to implement. It's not my favorite, but it would 
be better no doubt.

2) I used Network Configuration Operators for everyone because no other 
option was available. It's not great as you said, but users need to 
start and stop the VPN sometimes. I can't remove all rights.

3) Do you suggest a "read only" interface ? I looks like the opposite of 
what I need, the less users see the better.

4) It seems pretty complicate for a small improvement. Like you I'm not 
fan, but why not if Jason like it. It can but combined with the first 
option.

5) I like this option, but I supposed it wasn't possible. If it is, a 
group that can only access to the list of tunnels and start or stop them 
is a good solution for my environment. Removing Network Configuration 
Operators rights would be an improvement.

To summarize, the option 5 is what I'm looking for from the beginning. 
But if it's to complicate (or impossible) to do, the first one looks 
like a good start.

Rewording can be done easily and quickly (before a better solution is 
chosen, if possible). In that case, I indicate that I mainly use the 
french localization (it explains my poor english language level). Maybe 
the french version seems more aggressive that the english one? I don't 
know who leads this language translation, but I suggest him (or her) to 
change the Windows title "Obsolète" (out of date) to something softer, 
or nothing in the title just the update tab.

Thank for your time too,

Bruno ANDRY


Le 25/11/2021 à 15:23, lazerl0rd@thezest.dev a écrit :
> Dear Bruno,
>
> Whilst I understand the frustration that having hundreds of users can 
> cause, I don't believe simply reverting the change [as proposed by 
> Jason] is the correct solution. I've come up with a few alternative 
> solutions, but before I present them I'd just like to give a brief 
> introduction into why I requested that change in the first place.
>
> WireGuard on Windows exclusively provides a GUI to users of the 
> Administrators group, as well as a limited GUI to users of the Network 
> Configuration Operators group when the `LimitedOperatorUI` DWORD is 
> set. The latter is helpful for users who wish to separate their 
> personal and administrator accounts (to protect themselves against the 
> plethora of UAC exploits, amongst other security issues) where 
> otherwise the user would have to switch accounts to switch tunnels. 
> However, the GUI shown to Network Configuration Operators lacked any 
> information about updates. This lead to users in such setups to not be 
> informed about any updates unless they switched out to the 
> Administrator account and or kept an eye on the releases online. This 
> is quite a problem as users could be running ancient versions of 
> WireGuard for relatively long periods of time without the knowledge 
> that they are doing so (some users may even assume WireGuard 
> automatically updates). As such, I asked Jason if he could add the 
> ability for non-admins to at least be informed of an update which lead 
> to where we are today.
>
> After speaking to Jason "off the mailing list", he stated he wouldn't 
> like to add any more configuration options (via the Registry or within 
> the GUI) nor any metadata to updates so bearing that in mind I came up 
> with a few alternatives:
>
> 1) Rewording the update prompt for non-admins to appear less 
> "aggressive". Currently, the prompt is "Please ask the system 
> administrator to update." but this could be changed to something along 
> the lines of "There is an update available. The system administrator 
> will update when necessary." which should reduce most, if not all, 
> users from contacting you unnecessarily. I can throw up a patch for 
> this if Jason agrees.
>
> 2) Avoiding users seeing the UI at all, where unnecessary. If your 
> users do not need *control* of the WireGuard configuration, then 
> avoiding showing them the UI altogether could be an option. I don't 
> know your system as well as you do, of course, so I can't assure that 
> this solution is valid. However, having hundreds of users as Network 
> Configuration Operators sounds a little "worrying" to me.
>
> 3) Showing an even more limited UI for unprivileged users. If the 
> users still need some form of UI, then an even more limited UI could 
> be presented to users not part of the Administrators nor the Network 
> Configuration Operators groups. This would lack any form of control, 
> and could still be under the same `LimitedOperatorUI` Registry DWORD, 
> or not if is deemed "safe enough for the masses". If it is, you could 
> say the semantics refer to "Limited [User or Network] Operator UI".
>
> 4) Updates could be hidden from the UI for N days after an update or N 
> updates (preferably two in this case, so that it doesn't pile up) for 
> Network Configuration Operators. This provides you [and any other 
> sysadmins] with a "buffer zone" to apply the updates before users 
> contact you about them. This could also be teamed up with 1) to 
> further reduce the likelihood of users contacting you. I'm not a large 
> fan of this "solution", however, since WireGuard for Windows lacks any 
> metadata to differentiate important and optional updates which can 
> lead to a security patch or critical bug-fix being ignored for some time.
>
> 5) Creating a separate group which are able to switch tunnels. For 
> users who just need the GUI to switch tunnels, having a group specific 
> to such behavior named something along the lines of "WireGuard 
> Operators" could be helpful.
>
> Hopefully at least one of these suffices for you so that we can meet a 
> mid-point of sorts that matches both your criteria as well as my own.
>
> Thank for your time,
> Diab Neiroukh
>
> PS: Whilst it may seem a pain, I believe that a balance should be 
> achieved between the sysadmins and users where if the former forgets 
> to apply an update "for too long" then the users contact them as a 
> reminder. After all, we're all humans and we do forget sometimes. The 
> solutions 1) - with a prompt such as "There is an update available. 
> The system administrator should update soon." - and 4) match up to 
> this quite nicely.
>
> On 2021-11-24 15:42, Jason A. Donenfeld wrote:
>> I agree the situation is a bit ridiculous. I'll revert the change that
>> added this:
>> https://git.zx2c4.com/wireguard-windows/commit/?id=82129ba288f7561c89bb80e04841ffb46bc29889 
>>
>>
>> I'm CCing Diab, who originally requested the change, in case he wants
>> to argue with you about it. But in the absence of that, I'll revert.
>
> !DSPAM:5,619f9c6d262291485912835!
>
>
