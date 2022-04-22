Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BCFC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:12:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 07aaf595;
	Sun, 24 Apr 2022 20:09:56 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 44d1cf6f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 20:26:55 +0000 (UTC)
Received: from [192.168.10.75] ([95.91.235.163]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAwoL-1nb9Ea05XN-00BPD6; Fri, 22 Apr 2022 22:21:49 +0200
Message-ID: <4b222049-3ea1-356b-d50c-6b6533fb9eb1@anterias.io>
Date: Fri, 22 Apr 2022 22:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Adrian Larsen <alarsen@maidenheadbridge.com>,
 Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
 <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
 <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
 <CABtXGiAK_T0sVPPq_aXLs_fnPG=A9bKZrN-oj7dZa4Wb2j0_Eg@mail.gmail.com>
 <CAHmME9qAmJt7C7KefU9m-9NkqdmkkGWY34YFwNT0Qm-N_1Tkxw@mail.gmail.com>
In-Reply-To: <CAHmME9qAmJt7C7KefU9m-9NkqdmkkGWY34YFwNT0Qm-N_1Tkxw@mail.gmail.com>
From: "zer0flash@anterias.io" <zer0flash@anterias.io>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:E79aZ65HP8Gnb9Ya99vpba2ia24kMxXxbLdQnklwmgqs7mUZ8zo
 zHqOR4UWrVQNV21l45bRi/iteh2+vJoRoT51rhufOwhYF/UHWjIk6ZTRTKnCeNeXrDYia8L
 n9EKIsQ8/ftunMTO8/OY13qtYV52qIbz1a1iQFXcksqdrBiYGmW1ZOxuPgABwHBr7AusIJM
 E+hUDgwHtfxxr4B3JBtLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:edBgEZecyHs=:YOQO8Ok4Ty0HcOax6ftVa9
 OgJ+zBHnEZx/W79ThaW9zP+gxqB1SKbQbZQ3PnzotowtZqXP9TJwJV7fgGbEwFODlOtE/6nuv
 nINb2ZLit7GuRTf01azFVKI0l+Uo70ok3mTyr7OhR0CDVOWOyfu+bcks1KqRTgQgQ20Z1P+WY
 mShB4SyeN4FBx7jmnyH2IqugyFg5FDEy+Jte6WVFBQukD+0vjg/V6OpVouEGxtc9ArZcf49tK
 Y2ZWSpmk27ipuMMcdbqiD5RUNQQGpb++LlVRQBBuC1n6lOF7AhfRI9dIHsGphlXJRrrbwQCHo
 HQvYyVkSSnkK7McBZPg6F5XXukDEvWvVDSzlX2Qcut5V2GC1PXY/oRUIl4DJKi1+Ltn9PR5cz
 ZKM4m7LyIzSm3mOLjqIeYbzNzCNupD7YCPkhqkLg1q5DITC5ZeEeZCJK4qXJSb04i3qJXxP9x
 F14dbjDFH3tJrzEKby9J/NQ6zvyCGfttrZNw11MI0vLtybK+3aJeXtuGiGtXPsv0mCU4h4XNL
 HXUqZL2knSnHYjc6/ttfm9EW/5dnB4WqUSetxym+E4kLpBfbXgJRFf/Vu4v9/NsbmQr/0fJSL
 C2C/07vyXb+8WwZwCJQzMCWpWQFaeNRUJXZW7cWBieRfSPxLTDBTgdc2WFtAAmWu3JTLD/VwG
 1leFqUUrLIYKcYKdQFDhY9QC8SctmpIji+RjTV+qfzu002JrjV/CoWioruJ9ija0yMXV+C/3t
 EkIvfyDoFTdSd/6m
X-Mailman-Approved-At: Sun, 24 Apr 2022 20:09:51 +0000
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

Hi,

On Sun, Nov 29, 2020 at 9:59 PM Jason A. Donenfeld wrote:
> On Sun, Nov 29, 2020 at 8:44 PM Phillip McMahon
> <phillip.mcmahon@gmail.com> wrote:
>> Won't drag this already long and confusing thread out. Not challenging
>> the current implementation, just the notion that any other suggestion
>> is a dead end and the topic is closed.
> 
> Alright. Well, if you do think of good reasons why NCO is not a good
> match for unpriv'd WireGuard control, please let me know. The whole
> basis of going that route is the apparent intuition that these two
> types of things, network modification and tunnel up/down, are one and
> the same. But if you have in mind a way where the analogy breaks down,
> that'd be very interesting to learn and would potentially be grounds
> for changing course.

We provision a lot of road warrior laptops, where users are not admins. 
They can of course use 5g, wifi or lan as required and have to be able 
to switch on/off the vpn tunnel. If working from our office for example, 
they do not need the vpn due to an existing site-to-site vpn connection. 
So they need to turn it off by themselves. That's why the feature makes 
a lot of sense in my humble opinition.

However, any member of the local "Network Configuration Operators" group 
is not only able to to activate the WireGuard tunnel but also

- disable any firewall rules
- add new any firewall rules
- disable the whole firewall by changing the default to allow all incoming
- change ip address / dns settings on any interface

I think that adding an otherwise unprivileged user to the NCO group just 
for activating a preconfigured vpn tunnel might pose security issues in 
other areas.

> 
> Jason
> 

Regards

--
Fabian
