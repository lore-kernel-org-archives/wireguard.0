Return-Path: adorman@ironicdesign.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8884223b
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 14:02:44 +0000 (UTC)
Received: from beatrice.ironicdesign.com (beatrice.ironicdesign.com
 [206.166.194.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6923bd7
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 14:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by beatrice.ironicdesign.com (Postfix) with QMQP id A70E0D408CF
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 09:07:45 -0500 (CDT)
Received: from [192.168.1.189] (unknown [136.53.4.130])
 (Authenticated sender: adorman@ironicdesign.com)
 by incoming.antespam.com (Postfix) with ESMTPSA id 672CAD407D5
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 09:07:44 -0500 (CDT)
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: wireguard@lists.zx2c4.com
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
From: Andy Dorman <adorman@ironicdesign.com>
Message-ID: <c80282cc-5c43-e2fc-3656-efeca01c15b6@ironicdesign.com>
Date: Fri, 22 Jun 2018 09:07:43 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 6/21/18 8:41 PM, Jason A. Donenfeld wrote:
> So, the question we need to ask is whether this problem is important
> enough that these useful features should be_removed_? Or if there's a
> way to make them safer? Or if it just doesn't matter that much and we
> shouldn't do anything.

We use wg-quick with PostUp/PostDown/PreUp/PreDown and would prefer that 
feature be retained.

However, looking ahead I believe Wireguard's speed, simplicity, and 
simple, straightforward configuration and operation is going to attract 
marginally competent amateur users that definitely do not qualify as a 
system or network admin.

So, while it should be obvious, it wouldn't hurt to add a short warning 
(in bold) to the wg-quick man page that lets these "amateur" users know 
of the potential danger.  Something along the lines of "Using a config 
written by someone else that you do not understand and have not vetted 
for security is stupid and can be dangerous. For example, the 
PostUp/PostDown/PreUp/PreDown commands can be used to enable malicious 
code.  So always be certain your configuration and the code it executes 
does only what you expect."

Sincere regards,

-- 
Andy Dorman
Ironic Design, Inc.
AnteSpam.com
