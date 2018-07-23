clear; clc;

x = 1;
set(gcf,'CurrentCharacter','@');

xPosition = 0;
yPosition = 0;
framerate = 1;
gameStart = 0;
direction = 'Up';
speed = 1;
gridsize = 100;
lineSpacing = gridsize/50;
numberOfLines = gridsize/lineSpacing;


while x
    
        switch direction
        case 'Up'
            yPosition = yPosition + speed;
        case 'Down'
            yPosition = yPosition - speed;
        case 'Left'
            xPosition = xPosition - speed;
        case 'Right'
            xPosition = xPosition + speed;
            
        end
        
    rectangle('Position',[xPosition,yPosition,lineSpacing,lineSpacing],'FaceColor',[0,.5,.5]);
    axis([0,gridsize,0,gridsize]);
    figure(1);
    
    for i = 1:numberOfLines
        line([i*lineSpacing,i*lineSpacing],[0,gridsize]);
        line([0,gridsize],[i*lineSpacing,i*lineSpacing]);
    end
    
    if gameStart == 0
        input('hit enter to start\n');
        gameStart = 1;
    end
    
    k = get(gcf,'CurrentCharacter');
    if k ~= '@'        
        switch k
            case 'w'
                direction = 'Up';
            case 's'
                direction = 'Down';
            case 'a'
                direction = 'Left';
            case 'd'
                direction = 'Right';
            case 'r'
                x = 0;
        end
        k = resetCharacter;
    end
    

    pause(1/framerate);
    clf;
end

close; clear; clc;

function c = resetCharacter
c = set(gcf,'CurrentCharacter','@');
end