Return-Path: adorman@ironicdesign.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 972c9fdd
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 14:42:40 +0000 (UTC)
Received: from ophelia.ironicdesign.com (ophelia.ironicdesign.com
 [206.166.194.242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b93e9ab
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 14:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ophelia.ironicdesign.com (Postfix) with QMQP id 2D40B20E008E
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 09:47:42 -0500 (CDT)
Received: from [192.168.1.189] (unknown [136.53.4.130])
 (Authenticated sender: adorman@ironicdesign.com)
 by incoming.antespam.com (Postfix) with ESMTPSA id B72A620E0085
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 09:47:41 -0500 (CDT)
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: wireguard@lists.zx2c4.com
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
 <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
 <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
From: Andy Dorman <adorman@ironicdesign.com>
Message-ID: <f90aecb6-f8bc-a03d-320e-9354b9071684@ironicdesign.com>
Date: Fri, 22 Jun 2018 09:47:40 -0500
MIME-Version: 1.0
In-Reply-To: <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 6/22/18 8:08 AM, Jacob Baines wrote:
> There also seems to be an expectation that users should understand these 
> config files. I'm not sure why that is. Excuse my speaking in 
> generalities but a majority of users aren't going to understand how 
> OpenVPN works, let alone how the configuration file affects the program. 
> Many users (myself included) simply receive config files from our bosses 
> or our IT guy and trust that they aren't malicious. Call me naive or 
> foolish but I don't review every single file passed my way for malicious 
> content.

We run an email security service and we MUST understand the action of 
every line in the config files on our servers. Of course we also 
carefully limit the applications on these servers so we have a limited 
set of config files to deal with. ;-)

But I agree that perhaps the warning should be to either know what the 
config is doing OR it should be from a trusted source (ie, your boss or 
IT person or some other known, trusted entity).

The main point about a warning for wg-quick is to try and help the 
average user know that there can be a danger in the pre- and post- 
commands so they will perhaps look twice before using a config that they 
grabbed off an untrusted source.

-- 
Andy Dorman
Ironic Design, Inc.
AnteSpam.com
